(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_2 ?v4)
		(pred_3 ?v5)
		(pred_5 ?v5)
		(pred_4 ?v4 ?v5)
		(pred_1)
		(pred_6 ?v4))

   (:action op_3
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_3 ?v6) (pred_3 ?v2) (pred_5 ?v6))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v6))))


   (:action op_1
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v3)
			    (pred_4 ?v7 ?v3) (pred_5 ?v3) (pred_1))
       :effect (and (pred_6 ?v7)
		    (not (pred_4 ?v7 ?v3)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v3)
			    (pred_6 ?v7) (pred_5 ?v3))
       :effect (and (pred_4 ?v7 ?v3)
		    (pred_1)
		    (not (pred_6 ?v7)))))

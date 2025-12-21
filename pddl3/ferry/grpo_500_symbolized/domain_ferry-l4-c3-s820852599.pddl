(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v8)
		(pred_5 ?v5)
		(pred_4 ?v1)
		(pred_2 ?v1)
		(pred_6 ?v5 ?v1)
		(pred_1)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_4 ?v6) (pred_4 ?v3) (pred_2 ?v6))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v6))))


   (:action op_3
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_5 ?v7) (pred_4 ?v4)
			    (pred_6 ?v7 ?v4) (pred_2 ?v4) (pred_1))
       :effect (and (pred_3 ?v7)
		    (not (pred_6 ?v7 ?v4)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_5 ?v7) (pred_4 ?v4)
			    (pred_3 ?v7) (pred_2 ?v4))
       :effect (and (pred_6 ?v7 ?v4)
		    (pred_1)
		    (not (pred_3 ?v7)))))

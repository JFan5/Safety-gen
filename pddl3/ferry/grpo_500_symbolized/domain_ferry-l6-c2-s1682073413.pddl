(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_3 ?v4)
		(pred_1 ?v2)
		(pred_4 ?v2)
		(pred_2 ?v4 ?v2)
		(pred_6)
		(pred_5 ?v4))

   (:action op_3
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_1 ?v1) (pred_1 ?v6) (pred_4 ?v1))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v1))))


   (:action op_1
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v3)
			    (pred_2 ?v7 ?v3) (pred_4 ?v3) (pred_6))
       :effect (and (pred_5 ?v7)
		    (not (pred_2 ?v7 ?v3)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v3)
			    (pred_5 ?v7) (pred_4 ?v3))
       :effect (and (pred_2 ?v7 ?v3)
		    (pred_6)
		    (not (pred_5 ?v7)))))

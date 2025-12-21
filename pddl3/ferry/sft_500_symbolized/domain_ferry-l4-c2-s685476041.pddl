(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_6 ?v8)
		(pred_5 ?v2)
		(pred_3 ?v2)
		(pred_2 ?v8 ?v2)
		(pred_1)
		(pred_4 ?v8))

   (:action op_2
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_5 ?v4) (pred_5 ?v6) (pred_3 ?v4))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v4))))


   (:action op_3
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_6 ?v7) (pred_5 ?v3)
			    (pred_2 ?v7 ?v3) (pred_3 ?v3) (pred_1))
       :effect (and (pred_4 ?v7)
		    (not (pred_2 ?v7 ?v3)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_6 ?v7) (pred_5 ?v3)
			    (pred_4 ?v7) (pred_3 ?v3))
       :effect (and (pred_2 ?v7 ?v3)
		    (pred_1)
		    (not (pred_4 ?v7)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_5 ?v1)
		(pred_1 ?v8)
		(pred_6 ?v8)
		(pred_3 ?v1 ?v8)
		(pred_2)
		(pred_4 ?v1))

   (:action op_1
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_1 ?v4) (pred_1 ?v3) (pred_6 ?v4))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v4))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v7)
			    (pred_3 ?v6 ?v7) (pred_6 ?v7) (pred_2))
       :effect (and (pred_4 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v7)
			    (pred_4 ?v6) (pred_6 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_2)
		    (not (pred_4 ?v6)))))

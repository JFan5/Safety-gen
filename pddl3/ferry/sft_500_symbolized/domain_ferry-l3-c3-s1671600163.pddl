(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_6 ?v5)
		(pred_3 ?v1)
		(pred_1 ?v1)
		(pred_2 ?v5 ?v1)
		(pred_4)
		(pred_5 ?v5))

   (:action op_3
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_3 ?v4) (pred_3 ?v3) (pred_1 ?v4))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_6 ?v6) (pred_3 ?v7)
			    (pred_2 ?v6 ?v7) (pred_1 ?v7) (pred_4))
       :effect (and (pred_5 ?v6)
		    (not (pred_2 ?v6 ?v7)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_6 ?v6) (pred_3 ?v7)
			    (pred_5 ?v6) (pred_1 ?v7))
       :effect (and (pred_2 ?v6 ?v7)
		    (pred_4)
		    (not (pred_5 ?v6)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_2 ?v8)
		(pred_5 ?v6)
		(pred_1 ?v6)
		(pred_6 ?v8 ?v6)
		(pred_4)
		(pred_3 ?v8))

   (:action op_1
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_5 ?v2) (pred_5 ?v4) (pred_1 ?v2))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v2))))


   (:action op_3
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_2 ?v3) (pred_5 ?v7)
			    (pred_6 ?v3 ?v7) (pred_1 ?v7) (pred_4))
       :effect (and (pred_3 ?v3)
		    (not (pred_6 ?v3 ?v7)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_2 ?v3) (pred_5 ?v7)
			    (pred_3 ?v3) (pred_1 ?v7))
       :effect (and (pred_6 ?v3 ?v7)
		    (pred_4)
		    (not (pred_3 ?v3)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_1 ?v6)
		(pred_4 ?v5)
		(pred_2 ?v5)
		(pred_6 ?v6 ?v5)
		(pred_3)
		(pred_5 ?v6))

   (:action op_3
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_4 ?v2) (pred_4 ?v4) (pred_2 ?v2))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_1 ?v8) (pred_4 ?v7)
			    (pred_6 ?v8 ?v7) (pred_2 ?v7) (pred_3))
       :effect (and (pred_5 ?v8)
		    (not (pred_6 ?v8 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_1 ?v8) (pred_4 ?v7)
			    (pred_5 ?v8) (pred_2 ?v7))
       :effect (and (pred_6 ?v8 ?v7)
		    (pred_3)
		    (not (pred_5 ?v8)))))

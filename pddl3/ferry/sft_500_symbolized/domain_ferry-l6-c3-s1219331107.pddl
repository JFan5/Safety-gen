(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_6 ?v2)
		(pred_5 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v2 ?v6)
		(pred_2)
		(pred_3 ?v2))

   (:action op_3
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_5 ?v3) (pred_5 ?v7) (pred_4 ?v3))
       :effect (and  (pred_4 ?v7)
		     (not (pred_4 ?v3))))


   (:action op_2
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v4)
			    (pred_1 ?v8 ?v4) (pred_4 ?v4) (pred_2))
       :effect (and (pred_3 ?v8)
		    (not (pred_1 ?v8 ?v4)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v4)
			    (pred_3 ?v8) (pred_4 ?v4))
       :effect (and (pred_1 ?v8 ?v4)
		    (pred_2)
		    (not (pred_3 ?v8)))))

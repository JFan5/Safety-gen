(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_5 ?v3)
		(pred_4 ?v2)
		(pred_1 ?v2)
		(pred_3 ?v3 ?v2)
		(pred_2)
		(pred_6 ?v3))

   (:action op_2
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_4 ?v8) (pred_4 ?v1) (pred_1 ?v8))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v8))))


   (:action op_1
       :parameters (?v5 ?v7)
       :precondition  (and  (pred_5 ?v5) (pred_4 ?v7)
			    (pred_3 ?v5 ?v7) (pred_1 ?v7) (pred_2))
       :effect (and (pred_6 ?v5)
		    (not (pred_3 ?v5 ?v7)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v5  ?v7)
       :precondition  (and  (pred_5 ?v5) (pred_4 ?v7)
			    (pred_6 ?v5) (pred_1 ?v7))
       :effect (and (pred_3 ?v5 ?v7)
		    (pred_2)
		    (not (pred_6 ?v5)))))

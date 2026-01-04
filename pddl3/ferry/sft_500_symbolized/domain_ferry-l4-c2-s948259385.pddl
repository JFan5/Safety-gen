(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_2 ?v1)
		(pred_1 ?v4)
		(pred_3 ?v4)
		(pred_4 ?v1 ?v4)
		(pred_5)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_1 ?v2) (pred_1 ?v3) (pred_3 ?v2))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v2))))


   (:action op_3
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_2 ?v8) (pred_1 ?v7)
			    (pred_4 ?v8 ?v7) (pred_3 ?v7) (pred_5))
       :effect (and (pred_6 ?v8)
		    (not (pred_4 ?v8 ?v7)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_2 ?v8) (pred_1 ?v7)
			    (pred_6 ?v8) (pred_3 ?v7))
       :effect (and (pred_4 ?v8 ?v7)
		    (pred_5)
		    (not (pred_6 ?v8)))))

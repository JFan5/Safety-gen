(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_6 ?v2)
		(pred_4 ?v4)
		(pred_1 ?v4)
		(pred_3 ?v2 ?v4)
		(pred_5)
		(pred_2 ?v2))

   (:action op_3
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_4 ?v8) (pred_4 ?v3) (pred_1 ?v8))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v8))))


   (:action op_2
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v5)
			    (pred_3 ?v7 ?v5) (pred_1 ?v5) (pred_5))
       :effect (and (pred_2 ?v7)
		    (not (pred_3 ?v7 ?v5)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v5)
			    (pred_2 ?v7) (pred_1 ?v5))
       :effect (and (pred_3 ?v7 ?v5)
		    (pred_5)
		    (not (pred_2 ?v7)))))

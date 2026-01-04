(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_3 ?v5)
		(pred_6 ?v3)
		(pred_1 ?v3)
		(pred_4 ?v5 ?v3)
		(pred_2)
		(pred_5 ?v5))

   (:action op_1
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_6 ?v6) (pred_6 ?v2) (pred_1 ?v6))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v6))))


   (:action op_2
       :parameters (?v8 ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v7)
			    (pred_4 ?v8 ?v7) (pred_1 ?v7) (pred_2))
       :effect (and (pred_5 ?v8)
		    (not (pred_4 ?v8 ?v7)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v8  ?v7)
       :precondition  (and  (pred_3 ?v8) (pred_6 ?v7)
			    (pred_5 ?v8) (pred_1 ?v7))
       :effect (and (pred_4 ?v8 ?v7)
		    (pred_2)
		    (not (pred_5 ?v8)))))

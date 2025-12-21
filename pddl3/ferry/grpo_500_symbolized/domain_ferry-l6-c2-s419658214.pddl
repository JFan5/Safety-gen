(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_1 ?v6)
		(pred_2 ?v4)
		(pred_3 ?v4)
		(pred_4 ?v6 ?v4)
		(pred_6)
		(pred_5 ?v6))

   (:action op_3
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_2 ?v2) (pred_2 ?v7) (pred_3 ?v2))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_1 ?v1) (pred_2 ?v8)
			    (pred_4 ?v1 ?v8) (pred_3 ?v8) (pred_6))
       :effect (and (pred_5 ?v1)
		    (not (pred_4 ?v1 ?v8)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_1 ?v1) (pred_2 ?v8)
			    (pred_5 ?v1) (pred_3 ?v8))
       :effect (and (pred_4 ?v1 ?v8)
		    (pred_6)
		    (not (pred_5 ?v1)))))

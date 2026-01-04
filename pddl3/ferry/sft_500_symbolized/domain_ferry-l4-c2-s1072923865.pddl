(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_3 ?v1)
		(pred_5 ?v5)
		(pred_1 ?v5)
		(pred_2 ?v1 ?v5)
		(pred_6)
		(pred_4 ?v1))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_5 ?v2) (pred_5 ?v3) (pred_1 ?v2))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v2))))


   (:action op_3
       :parameters (?v8 ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_5 ?v6)
			    (pred_2 ?v8 ?v6) (pred_1 ?v6) (pred_6))
       :effect (and (pred_4 ?v8)
		    (not (pred_2 ?v8 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v8  ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_5 ?v6)
			    (pred_4 ?v8) (pred_1 ?v6))
       :effect (and (pred_2 ?v8 ?v6)
		    (pred_6)
		    (not (pred_4 ?v8)))))

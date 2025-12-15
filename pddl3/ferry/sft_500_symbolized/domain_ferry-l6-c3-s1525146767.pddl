(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_6 ?v5)
		(pred_1 ?v3)
		(pred_3 ?v3)
		(pred_4 ?v5 ?v3)
		(pred_5)
		(pred_2 ?v5))

   (:action op_3
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_1 ?v6) (pred_1 ?v7) (pred_3 ?v6))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v6))))


   (:action op_1
       :parameters (?v2 ?v8)
       :precondition  (and  (pred_6 ?v2) (pred_1 ?v8)
			    (pred_4 ?v2 ?v8) (pred_3 ?v8) (pred_5))
       :effect (and (pred_2 ?v2)
		    (not (pred_4 ?v2 ?v8)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v2  ?v8)
       :precondition  (and  (pred_6 ?v2) (pred_1 ?v8)
			    (pred_2 ?v2) (pred_3 ?v8))
       :effect (and (pred_4 ?v2 ?v8)
		    (pred_5)
		    (not (pred_2 ?v2)))))

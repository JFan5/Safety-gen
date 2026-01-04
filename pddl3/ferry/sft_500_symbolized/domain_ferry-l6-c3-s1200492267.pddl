(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_1 ?v3)
		(pred_3 ?v8)
		(pred_4 ?v8)
		(pred_2 ?v3 ?v8)
		(pred_5)
		(pred_6 ?v3))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_3 ?v6) (pred_3 ?v5) (pred_4 ?v6))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_1 ?v2) (pred_3 ?v7)
			    (pred_2 ?v2 ?v7) (pred_4 ?v7) (pred_5))
       :effect (and (pred_6 ?v2)
		    (not (pred_2 ?v2 ?v7)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_1 ?v2) (pred_3 ?v7)
			    (pred_6 ?v2) (pred_4 ?v7))
       :effect (and (pred_2 ?v2 ?v7)
		    (pred_5)
		    (not (pred_6 ?v2)))))

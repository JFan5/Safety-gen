(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_2 ?v8)
		(pred_6 ?v7)
		(pred_4 ?v7)
		(pred_1 ?v8 ?v7)
		(pred_5)
		(pred_3 ?v8))

   (:action op_2
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_6 ?v6) (pred_6 ?v3) (pred_4 ?v6))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v6))))


   (:action op_3
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_2 ?v2) (pred_6 ?v4)
			    (pred_1 ?v2 ?v4) (pred_4 ?v4) (pred_5))
       :effect (and (pred_3 ?v2)
		    (not (pred_1 ?v2 ?v4)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_2 ?v2) (pred_6 ?v4)
			    (pred_3 ?v2) (pred_4 ?v4))
       :effect (and (pred_1 ?v2 ?v4)
		    (pred_5)
		    (not (pred_3 ?v2)))))

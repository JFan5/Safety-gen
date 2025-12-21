(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v4)
		(pred_2 ?v8)
		(pred_3 ?v7)
		(pred_4 ?v7)
		(pred_1 ?v8 ?v7)
		(pred_5)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_3 ?v2) (pred_3 ?v3) (pred_4 ?v2))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v2))))


   (:action op_3
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_3 ?v6)
			    (pred_1 ?v1 ?v6) (pred_4 ?v6) (pred_5))
       :effect (and (pred_6 ?v1)
		    (not (pred_1 ?v1 ?v6)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_3 ?v6)
			    (pred_6 ?v1) (pred_4 ?v6))
       :effect (and (pred_1 ?v1 ?v6)
		    (pred_5)
		    (not (pred_6 ?v1)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_6 ?v4)
		(pred_4 ?v1)
		(pred_1 ?v1)
		(pred_2 ?v4 ?v1)
		(pred_3)
		(pred_5 ?v4))

   (:action op_3
       :parameters  (?v5 ?v8)
       :precondition (and (not-eq ?v5 ?v8) 
                          (pred_4 ?v5) (pred_4 ?v8) (pred_1 ?v5))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v5))))


   (:action op_2
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_6 ?v2) (pred_4 ?v6)
			    (pred_2 ?v2 ?v6) (pred_1 ?v6) (pred_3))
       :effect (and (pred_5 ?v2)
		    (not (pred_2 ?v2 ?v6)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_6 ?v2) (pred_4 ?v6)
			    (pred_5 ?v2) (pred_1 ?v6))
       :effect (and (pred_2 ?v2 ?v6)
		    (pred_3)
		    (not (pred_5 ?v2)))))

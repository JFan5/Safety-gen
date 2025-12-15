(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_1 ?v3)
		(pred_6 ?v1)
		(pred_3 ?v1)
		(pred_2 ?v3 ?v1)
		(pred_5)
		(pred_4 ?v3))

   (:action op_2
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_6 ?v8) (pred_6 ?v2) (pred_3 ?v8))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v8))))


   (:action op_3
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v6)
			    (pred_2 ?v5 ?v6) (pred_3 ?v6) (pred_5))
       :effect (and (pred_4 ?v5)
		    (not (pred_2 ?v5 ?v6)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v6)
			    (pred_4 ?v5) (pred_3 ?v6))
       :effect (and (pred_2 ?v5 ?v6)
		    (pred_5)
		    (not (pred_4 ?v5)))))

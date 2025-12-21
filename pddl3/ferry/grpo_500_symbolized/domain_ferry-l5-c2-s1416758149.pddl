(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_3 ?v4)
		(pred_6 ?v3)
		(pred_2 ?v3)
		(pred_4 ?v4 ?v3)
		(pred_5)
		(pred_1 ?v4))

   (:action op_3
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_6 ?v8) (pred_6 ?v5) (pred_2 ?v8))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v8))))


   (:action op_2
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_3 ?v6) (pred_6 ?v2)
			    (pred_4 ?v6 ?v2) (pred_2 ?v2) (pred_5))
       :effect (and (pred_1 ?v6)
		    (not (pred_4 ?v6 ?v2)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_3 ?v6) (pred_6 ?v2)
			    (pred_1 ?v6) (pred_2 ?v2))
       :effect (and (pred_4 ?v6 ?v2)
		    (pred_5)
		    (not (pred_1 ?v6)))))

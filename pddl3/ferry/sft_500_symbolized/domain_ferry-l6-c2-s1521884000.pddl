(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_4 ?v6)
		(pred_1 ?v5)
		(pred_3 ?v5)
		(pred_2 ?v6 ?v5)
		(pred_5)
		(pred_6 ?v6))

   (:action op_1
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_1 ?v7) (pred_1 ?v1) (pred_3 ?v7))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v7))))


   (:action op_2
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_4 ?v4) (pred_1 ?v8)
			    (pred_2 ?v4 ?v8) (pred_3 ?v8) (pred_5))
       :effect (and (pred_6 ?v4)
		    (not (pred_2 ?v4 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_4 ?v4) (pred_1 ?v8)
			    (pred_6 ?v4) (pred_3 ?v8))
       :effect (and (pred_2 ?v4 ?v8)
		    (pred_5)
		    (not (pred_6 ?v4)))))

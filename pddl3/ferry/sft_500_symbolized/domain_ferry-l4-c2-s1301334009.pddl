(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v4)
		(pred_6 ?v5)
		(pred_4 ?v7)
		(pred_3 ?v7)
		(pred_1 ?v5 ?v7)
		(pred_5)
		(pred_2 ?v5))

   (:action op_2
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_4 ?v3) (pred_4 ?v6) (pred_3 ?v3))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v3))))


   (:action op_3
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v1)
			    (pred_1 ?v8 ?v1) (pred_3 ?v1) (pred_5))
       :effect (and (pred_2 ?v8)
		    (not (pred_1 ?v8 ?v1)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v1)
			    (pred_2 ?v8) (pred_3 ?v1))
       :effect (and (pred_1 ?v8 ?v1)
		    (pred_5)
		    (not (pred_2 ?v8)))))

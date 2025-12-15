(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_6 ?v4)
		(pred_4 ?v3)
		(pred_3 ?v3)
		(pred_1 ?v4 ?v3)
		(pred_5)
		(pred_2 ?v4))

   (:action op_1
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_4 ?v1) (pred_4 ?v5) (pred_3 ?v1))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v1))))


   (:action op_2
       :parameters (?v8 ?v6)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v6)
			    (pred_1 ?v8 ?v6) (pred_3 ?v6) (pred_5))
       :effect (and (pred_2 ?v8)
		    (not (pred_1 ?v8 ?v6)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v8  ?v6)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v6)
			    (pred_2 ?v8) (pred_3 ?v6))
       :effect (and (pred_1 ?v8 ?v6)
		    (pred_5)
		    (not (pred_2 ?v8)))))

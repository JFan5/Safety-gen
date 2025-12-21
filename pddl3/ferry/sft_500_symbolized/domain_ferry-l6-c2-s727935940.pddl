(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_1 ?v4)
		(pred_2 ?v8)
		(pred_3 ?v8)
		(pred_6 ?v4 ?v8)
		(pred_5)
		(pred_4 ?v4))

   (:action op_2
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_2 ?v1) (pred_2 ?v2) (pred_3 ?v1))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v1))))


   (:action op_3
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_1 ?v3) (pred_2 ?v6)
			    (pred_6 ?v3 ?v6) (pred_3 ?v6) (pred_5))
       :effect (and (pred_4 ?v3)
		    (not (pred_6 ?v3 ?v6)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_1 ?v3) (pred_2 ?v6)
			    (pred_4 ?v3) (pred_3 ?v6))
       :effect (and (pred_6 ?v3 ?v6)
		    (pred_5)
		    (not (pred_4 ?v3)))))

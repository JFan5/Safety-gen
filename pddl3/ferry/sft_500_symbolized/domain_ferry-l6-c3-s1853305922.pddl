(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v4)
		(pred_2 ?v5)
		(pred_3 ?v7)
		(pred_5 ?v7)
		(pred_4 ?v5 ?v7)
		(pred_6)
		(pred_1 ?v5))

   (:action op_3
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_3 ?v1) (pred_3 ?v8) (pred_5 ?v1))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v1))))


   (:action op_1
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_2 ?v3) (pred_3 ?v6)
			    (pred_4 ?v3 ?v6) (pred_5 ?v6) (pred_6))
       :effect (and (pred_1 ?v3)
		    (not (pred_4 ?v3 ?v6)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_2 ?v3) (pred_3 ?v6)
			    (pred_1 ?v3) (pred_5 ?v6))
       :effect (and (pred_4 ?v3 ?v6)
		    (pred_6)
		    (not (pred_1 ?v3)))))

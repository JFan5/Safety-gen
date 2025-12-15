(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_4 ?v8)
		(pred_2 ?v2)
		(pred_1 ?v2)
		(pred_3 ?v8 ?v2)
		(pred_6)
		(pred_5 ?v8))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_2 ?v3) (pred_2 ?v1) (pred_1 ?v3))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v3))))


   (:action op_2
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v6)
			    (pred_3 ?v4 ?v6) (pred_1 ?v6) (pred_6))
       :effect (and (pred_5 ?v4)
		    (not (pred_3 ?v4 ?v6)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v6)
			    (pred_5 ?v4) (pred_1 ?v6))
       :effect (and (pred_3 ?v4 ?v6)
		    (pred_6)
		    (not (pred_5 ?v4)))))

(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_1 ?v7)
		(pred_5 ?v2)
		(pred_3 ?v2)
		(pred_2 ?v7 ?v2)
		(pred_6)
		(pred_4 ?v7))

   (:action op_2
       :parameters  (?v1 ?v3)
       :precondition (and (not-eq ?v1 ?v3) 
                          (pred_5 ?v1) (pred_5 ?v3) (pred_3 ?v1))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v1))))


   (:action op_3
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_1 ?v4) (pred_5 ?v6)
			    (pred_2 ?v4 ?v6) (pred_3 ?v6) (pred_6))
       :effect (and (pred_4 ?v4)
		    (not (pred_2 ?v4 ?v6)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_1 ?v4) (pred_5 ?v6)
			    (pred_4 ?v4) (pred_3 ?v6))
       :effect (and (pred_2 ?v4 ?v6)
		    (pred_6)
		    (not (pred_4 ?v4)))))

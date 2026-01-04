(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_1 ?v6)
		(pred_2 ?v4)
		(pred_5 ?v4)
		(pred_4 ?v6 ?v4)
		(pred_6)
		(pred_3 ?v6))

   (:action op_3
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_2 ?v7) (pred_2 ?v3) (pred_5 ?v7))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v7))))


   (:action op_1
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_1 ?v8) (pred_2 ?v1)
			    (pred_4 ?v8 ?v1) (pred_5 ?v1) (pred_6))
       :effect (and (pred_3 ?v8)
		    (not (pred_4 ?v8 ?v1)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_1 ?v8) (pred_2 ?v1)
			    (pred_3 ?v8) (pred_5 ?v1))
       :effect (and (pred_4 ?v8 ?v1)
		    (pred_6)
		    (not (pred_3 ?v8)))))

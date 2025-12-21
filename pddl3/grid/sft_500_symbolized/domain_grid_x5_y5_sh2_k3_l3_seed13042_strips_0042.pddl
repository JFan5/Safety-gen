(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v4 ?v10)
             (pred_1 ?v8 ?v2)
             (pred_8 ?v4 ?v2)
             (pred_3 ?v6 ?v4 )
	     (pred_11 ?v4)
             (pred_6 ?v9)
             (pred_9 ?v8)
             (pred_7 ?v2)
             (pred_2 ?v4)
             (pred_10 ?v8)
             (pred_12 ?v4)
             (pred_4 ))



(:action op_3
:parameters (?v7 ?v11 ?v3 ?v12)
:precondition (and (pred_6 ?v7) (pred_6 ?v11) (pred_9 ?v3) (pred_7 ?v12)
          (pred_5 ?v7 ?v11) (pred_1 ?v3 ?v12)
                   (pred_8 ?v11 ?v12) (pred_11 ?v7) 
                   (pred_2 ?v11) (pred_10 ?v3))
:effect (and  (pred_12 ?v11) (not (pred_2 ?v11))))


(:action op_2
:parameters (?v7 ?v1)
:precondition (and (pred_6 ?v7) (pred_6 ?v1)
               (pred_11 ?v7) (pred_5 ?v7 ?v1) (pred_12 ?v1))
:effect (and (pred_11 ?v1) (not (pred_11 ?v7))))

(:action op_4
:parameters (?v7 ?v3)
:precondition (and (pred_6 ?v7) (pred_9 ?v3) 
                  (pred_11 ?v7) (pred_3 ?v3 ?v7) (pred_4 ))
:effect (and (pred_10 ?v3)
   (not (pred_3 ?v3 ?v7)) (not (pred_4 ))))


(:action op_5
:parameters (?v7 ?v5 ?v13)
:precondition (and (pred_6 ?v7) (pred_9 ?v5) (pred_9 ?v13)
                  (pred_11 ?v7) (pred_10 ?v13) (pred_3 ?v5 ?v7))
:effect (and (pred_10 ?v5) (pred_3 ?v13 ?v7)
        (not (pred_10 ?v13)) (not (pred_3 ?v5 ?v7))))

(:action op_1
:parameters (?v7 ?v3)
:precondition (and (pred_6 ?v7) (pred_9 ?v3) 
                  (pred_11 ?v7) (pred_10 ?v3))
:effect (and (pred_4 ) (pred_3 ?v3 ?v7) (not (pred_10 ?v3)))))


	

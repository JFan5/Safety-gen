(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v2 ?v9)
             (pred_5 ?v12 ?v1)
             (pred_3 ?v2 ?v1)
             (pred_2 ?v5 ?v2 )
	     (pred_6 ?v2)
             (pred_4 ?v4)
             (pred_7 ?v12)
             (pred_11 ?v1)
             (pred_8 ?v2)
             (pred_10 ?v12)
             (pred_12 ?v2)
             (pred_9 ))



(:action op_3
:parameters (?v3 ?v11 ?v8 ?v6)
:precondition (and (pred_4 ?v3) (pred_4 ?v11) (pred_7 ?v8) (pred_11 ?v6)
          (pred_1 ?v3 ?v11) (pred_5 ?v8 ?v6)
                   (pred_3 ?v11 ?v6) (pred_6 ?v3) 
                   (pred_8 ?v11) (pred_10 ?v8))
:effect (and  (pred_12 ?v11) (not (pred_8 ?v11))))


(:action op_5
:parameters (?v3 ?v10)
:precondition (and (pred_4 ?v3) (pred_4 ?v10)
               (pred_6 ?v3) (pred_1 ?v3 ?v10) (pred_12 ?v10))
:effect (and (pred_6 ?v10) (not (pred_6 ?v3))))

(:action op_1
:parameters (?v3 ?v8)
:precondition (and (pred_4 ?v3) (pred_7 ?v8) 
                  (pred_6 ?v3) (pred_2 ?v8 ?v3) (pred_9 ))
:effect (and (pred_10 ?v8)
   (not (pred_2 ?v8 ?v3)) (not (pred_9 ))))


(:action op_4
:parameters (?v3 ?v13 ?v7)
:precondition (and (pred_4 ?v3) (pred_7 ?v13) (pred_7 ?v7)
                  (pred_6 ?v3) (pred_10 ?v7) (pred_2 ?v13 ?v3))
:effect (and (pred_10 ?v13) (pred_2 ?v7 ?v3)
        (not (pred_10 ?v7)) (not (pred_2 ?v13 ?v3))))

(:action op_2
:parameters (?v3 ?v8)
:precondition (and (pred_4 ?v3) (pred_7 ?v8) 
                  (pred_6 ?v3) (pred_10 ?v8))
:effect (and (pred_9 ) (pred_2 ?v8 ?v3) (not (pred_10 ?v8)))))


	

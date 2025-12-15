; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 596219298 --problem-name spanner-s3-n3-l4-s596219298
(define (problem spanner-s3-n3-l4-s596219298)
 (:domain spanner)
 (:objects 
     obj_05 - type_3
     obj_08 obj_07 obj_09 - type_2
     obj_10 obj_11 obj_13 - type_1
     obj_04 obj_02 obj_01 obj_06 - type_4
     obj_12 obj_03 - type_4
    )
 (:init 
    (pred_1 obj_05 obj_12)
    (pred_1 obj_08 obj_02)
    (pred_2 obj_08)
    (pred_1 obj_07 obj_04)
    (pred_2 obj_07)
    (pred_1 obj_09 obj_01)
    (pred_2 obj_09)
    (pred_3 obj_10)
    (pred_1 obj_10 obj_03)
    (pred_3 obj_11)
    (pred_1 obj_11 obj_03)
    (pred_3 obj_13)
    (pred_1 obj_13 obj_03)
    (pred_5 obj_12 obj_04)
    (pred_5 obj_06 obj_03)
    (pred_5 obj_04 obj_02)
    (pred_5 obj_02 obj_01)
    (pred_5 obj_01 obj_06)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_11)
   (pred_6 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_12)))
  )
)
)

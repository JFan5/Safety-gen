; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1871038298 --problem-name spanner-s3-n3-l4-s1871038298
(define (problem spanner-s3-n3-l4-s1871038298)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_09 obj_08 obj_06 - type_5
     obj_05 obj_02 obj_04 - type_4
     obj_12 obj_03 obj_01 obj_07 - type_2
     obj_11 obj_10 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_11)
    (pred_2 obj_09 obj_01)
    (pred_1 obj_09)
    (pred_2 obj_08 obj_03)
    (pred_1 obj_08)
    (pred_2 obj_06 obj_03)
    (pred_1 obj_06)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_10)
    (pred_5 obj_02)
    (pred_2 obj_02 obj_10)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_10)
    (pred_6 obj_11 obj_12)
    (pred_6 obj_07 obj_10)
    (pred_6 obj_12 obj_03)
    (pred_6 obj_03 obj_01)
    (pred_6 obj_01 obj_07)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_02)
   (pred_3 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_02)) (not (pred_3 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_11)))
  )
)
)

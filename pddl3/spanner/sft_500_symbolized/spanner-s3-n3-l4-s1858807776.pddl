; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1858807776 --problem-name spanner-s3-n3-l4-s1858807776
(define (problem spanner-s3-n3-l4-s1858807776)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_07 obj_13 obj_06 - type_1
     obj_10 obj_01 obj_09 - type_5
     obj_04 obj_05 obj_12 obj_03 - type_2
     obj_11 obj_08 - type_2
    )
 (:init 
    (pred_6 obj_02 obj_11)
    (pred_6 obj_07 obj_05)
    (pred_3 obj_07)
    (pred_6 obj_13 obj_03)
    (pred_3 obj_13)
    (pred_6 obj_06 obj_05)
    (pred_3 obj_06)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_08)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_08)
    (pred_4 obj_09)
    (pred_6 obj_09 obj_08)
    (pred_5 obj_11 obj_04)
    (pred_5 obj_03 obj_08)
    (pred_5 obj_04 obj_05)
    (pred_5 obj_05 obj_12)
    (pred_5 obj_12 obj_03)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_01)
   (pred_1 obj_09)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_01))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_11)))
  )
)
)

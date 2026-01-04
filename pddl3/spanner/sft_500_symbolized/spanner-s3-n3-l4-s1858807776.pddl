; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1858807776 --problem-name spanner-s3-n3-l4-s1858807776
(define (problem spanner-s3-n3-l4-s1858807776)
 (:domain spanner)
 (:objects 
     obj_06 - type_1
     obj_10 obj_08 obj_09 - type_2
     obj_13 obj_02 obj_07 - type_3
     obj_05 obj_04 obj_01 obj_12 - type_4
     obj_03 obj_11 - type_4
    )
 (:init 
    (pred_4 obj_06 obj_03)
    (pred_4 obj_10 obj_04)
    (pred_3 obj_10)
    (pred_4 obj_08 obj_12)
    (pred_3 obj_08)
    (pred_4 obj_09 obj_04)
    (pred_3 obj_09)
    (pred_2 obj_13)
    (pred_4 obj_13 obj_11)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_11)
    (pred_2 obj_07)
    (pred_4 obj_07 obj_11)
    (pred_6 obj_03 obj_05)
    (pred_6 obj_12 obj_11)
    (pred_6 obj_05 obj_04)
    (pred_6 obj_04 obj_01)
    (pred_6 obj_01 obj_12)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_02)
   (pred_1 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_02))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_03)))
  )
)
)

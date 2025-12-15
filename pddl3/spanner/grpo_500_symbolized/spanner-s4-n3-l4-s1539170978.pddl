; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1539170978 --problem-name spanner-s4-n3-l4-s1539170978
(define (problem spanner-s4-n3-l4-s1539170978)
 (:domain spanner)
 (:objects 
     obj_01 - type_4
     obj_12 obj_08 obj_09 obj_07 - type_5
     obj_02 obj_14 obj_03 - type_1
     obj_10 obj_05 obj_04 obj_06 - type_3
     obj_13 obj_11 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_13)
    (pred_3 obj_12 obj_10)
    (pred_1 obj_12)
    (pred_3 obj_08 obj_05)
    (pred_1 obj_08)
    (pred_3 obj_09 obj_04)
    (pred_1 obj_09)
    (pred_3 obj_07 obj_04)
    (pred_1 obj_07)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_11)
    (pred_5 obj_14)
    (pred_3 obj_14 obj_11)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_11)
    (pred_4 obj_13 obj_10)
    (pred_4 obj_06 obj_11)
    (pred_4 obj_10 obj_05)
    (pred_4 obj_05 obj_04)
    (pred_4 obj_04 obj_06)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_14)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_14))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_13)))
  )
)
)

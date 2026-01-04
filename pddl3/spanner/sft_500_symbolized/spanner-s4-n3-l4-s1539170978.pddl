; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1539170978 --problem-name spanner-s4-n3-l4-s1539170978
(define (problem spanner-s4-n3-l4-s1539170978)
 (:domain spanner)
 (:objects 
     obj_11 - type_4
     obj_14 obj_10 obj_01 obj_03 - type_1
     obj_08 obj_02 obj_05 - type_3
     obj_06 obj_12 obj_09 obj_07 - type_5
     obj_04 obj_13 - type_5
    )
 (:init 
    (pred_1 obj_11 obj_04)
    (pred_1 obj_14 obj_06)
    (pred_2 obj_14)
    (pred_1 obj_10 obj_12)
    (pred_2 obj_10)
    (pred_1 obj_01 obj_09)
    (pred_2 obj_01)
    (pred_1 obj_03 obj_09)
    (pred_2 obj_03)
    (pred_4 obj_08)
    (pred_1 obj_08 obj_13)
    (pred_4 obj_02)
    (pred_1 obj_02 obj_13)
    (pred_4 obj_05)
    (pred_1 obj_05 obj_13)
    (pred_5 obj_04 obj_06)
    (pred_5 obj_07 obj_13)
    (pred_5 obj_06 obj_12)
    (pred_5 obj_12 obj_09)
    (pred_5 obj_09 obj_07)
)
 (:goal
  (and
   (pred_6 obj_08)
   (pred_6 obj_02)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_08)) (not (pred_6 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_04)))
  )
)
)

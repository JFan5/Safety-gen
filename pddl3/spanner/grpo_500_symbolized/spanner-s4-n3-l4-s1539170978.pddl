; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1539170978 --problem-name spanner-s4-n3-l4-s1539170978
(define (problem spanner-s4-n3-l4-s1539170978)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_04 obj_07 obj_05 obj_13 - type_3
     obj_06 obj_12 obj_01 - type_1
     obj_02 obj_08 obj_14 obj_09 - type_2
     obj_10 obj_11 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_10)
    (pred_6 obj_04 obj_02)
    (pred_5 obj_04)
    (pred_6 obj_07 obj_08)
    (pred_5 obj_07)
    (pred_6 obj_05 obj_14)
    (pred_5 obj_05)
    (pred_6 obj_13 obj_14)
    (pred_5 obj_13)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_11)
    (pred_4 obj_12)
    (pred_6 obj_12 obj_11)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_3 obj_10 obj_02)
    (pred_3 obj_09 obj_11)
    (pred_3 obj_02 obj_08)
    (pred_3 obj_08 obj_14)
    (pred_3 obj_14 obj_09)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_12)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_06)) (not (pred_1 obj_12))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_10)))
  )
)
)

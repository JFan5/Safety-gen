; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1539170978 --problem-name spanner-s4-n3-l4-s1539170978
(define (problem spanner-s4-n3-l4-s1539170978)
 (:domain spanner)
 (:objects 
     obj_03 - type_3
     obj_05 obj_11 obj_04 obj_08 - type_5
     obj_07 obj_09 obj_14 - type_4
     obj_06 obj_01 obj_10 obj_12 - type_2
     obj_13 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_03 obj_13)
    (pred_2 obj_05 obj_06)
    (pred_1 obj_05)
    (pred_2 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_2 obj_04 obj_10)
    (pred_1 obj_04)
    (pred_2 obj_08 obj_10)
    (pred_1 obj_08)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_02)
    (pred_5 obj_09)
    (pred_2 obj_09 obj_02)
    (pred_5 obj_14)
    (pred_2 obj_14 obj_02)
    (pred_6 obj_13 obj_06)
    (pred_6 obj_12 obj_02)
    (pred_6 obj_06 obj_01)
    (pred_6 obj_01 obj_10)
    (pred_6 obj_10 obj_12)
)
 (:goal
  (and
   (pred_3 obj_07)
   (pred_3 obj_09)
   (pred_3 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_07)) (not (pred_3 obj_09))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_13)))
  )
)
)

; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1539170978 --problem-name spanner-s4-n3-l4-s1539170978
(define (problem spanner-s4-n3-l4-s1539170978)
 (:domain spanner)
 (:objects 
     obj_11 - type_5
     obj_02 obj_06 obj_05 obj_09 - type_3
     obj_08 obj_04 obj_01 - type_1
     obj_14 obj_12 obj_13 obj_07 - type_4
     obj_03 obj_10 - type_4
    )
 (:init 
    (pred_5 obj_11 obj_03)
    (pred_5 obj_02 obj_14)
    (pred_6 obj_02)
    (pred_5 obj_06 obj_12)
    (pred_6 obj_06)
    (pred_5 obj_05 obj_13)
    (pred_6 obj_05)
    (pred_5 obj_09 obj_13)
    (pred_6 obj_09)
    (pred_2 obj_08)
    (pred_5 obj_08 obj_10)
    (pred_2 obj_04)
    (pred_5 obj_04 obj_10)
    (pred_2 obj_01)
    (pred_5 obj_01 obj_10)
    (pred_4 obj_03 obj_14)
    (pred_4 obj_07 obj_10)
    (pred_4 obj_14 obj_12)
    (pred_4 obj_12 obj_13)
    (pred_4 obj_13 obj_07)
)
 (:goal
  (and
   (pred_1 obj_08)
   (pred_1 obj_04)
   (pred_1 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_08)) (not (pred_1 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_03)))
  )
)
)

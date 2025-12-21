(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_1
obj_08 obj_03 obj_05 obj_07 - type_3
obj_10 obj_12 obj_11 - type_2
obj_02 obj_04 obj_09 - object)
(:init
(pred_4 obj_01 obj_12)
(pred_2 obj_01 obj_08)
(pred_2 obj_01 obj_03)
(pred_4 obj_06 obj_10)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_07)
(pred_3 obj_02 obj_10)
(pred_3 obj_04 obj_12)
(pred_3 obj_09 obj_11)
)
(:goal
(and
(pred_3 obj_02 obj_12)
(pred_3 obj_04 obj_10)
(pred_3 obj_09 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_01 obj_12) (pred_4 obj_06 obj_12))))
  )
)
)
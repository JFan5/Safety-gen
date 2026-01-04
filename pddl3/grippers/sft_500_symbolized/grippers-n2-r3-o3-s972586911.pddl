(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_3
obj_06 obj_07 obj_05 obj_01 - type_1
obj_02 obj_10 obj_12 - type_2
obj_09 obj_08 obj_04 - object)
(:init
(pred_2 obj_03 obj_10)
(pred_1 obj_03 obj_06)
(pred_1 obj_03 obj_07)
(pred_2 obj_11 obj_12)
(pred_1 obj_11 obj_05)
(pred_1 obj_11 obj_01)
(pred_4 obj_09 obj_02)
(pred_4 obj_08 obj_02)
(pred_4 obj_04 obj_10)
)
(:goal
(and
(pred_4 obj_09 obj_02)
(pred_4 obj_08 obj_12)
(pred_4 obj_04 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_03 obj_12) (pred_2 obj_11 obj_12))))
  )
)
)
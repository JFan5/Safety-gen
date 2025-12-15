(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_1
obj_05 obj_02 obj_07 obj_01 - type_3
obj_08 obj_06 obj_10 - type_2
obj_11 obj_09 obj_03 - object)
(:init
(pred_2 obj_04 obj_06)
(pred_3 obj_04 obj_05)
(pred_3 obj_04 obj_02)
(pred_2 obj_12 obj_10)
(pred_3 obj_12 obj_07)
(pred_3 obj_12 obj_01)
(pred_4 obj_11 obj_08)
(pred_4 obj_09 obj_08)
(pred_4 obj_03 obj_10)
)
(:goal
(and
(pred_4 obj_11 obj_08)
(pred_4 obj_09 obj_06)
(pred_4 obj_03 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_04 obj_06) (pred_2 obj_12 obj_06))))
  )
)
)
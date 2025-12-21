(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_03 obj_04 obj_05 obj_02 - type_3
obj_10 obj_08 obj_06 - type_2
obj_12 obj_11 obj_09 - object)
(:init
(pred_4 obj_07 obj_06)
(pred_2 obj_07 obj_03)
(pred_2 obj_07 obj_04)
(pred_4 obj_01 obj_08)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_02)
(pred_3 obj_12 obj_08)
(pred_3 obj_11 obj_06)
(pred_3 obj_09 obj_06)
)
(:goal
(and
(pred_3 obj_12 obj_06)
(pred_3 obj_11 obj_10)
(pred_3 obj_09 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_06) (pred_4 obj_01 obj_06))))
  )
)
)
(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_13 - type_1
obj_04 obj_02 obj_01 obj_09 - type_2
obj_07 obj_08 obj_10 obj_06 - type_3
obj_05 obj_14 obj_03 obj_12 - object)
(:init
(pred_1 obj_11 obj_10)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_02)
(pred_1 obj_13 obj_06)
(pred_3 obj_13 obj_01)
(pred_3 obj_13 obj_09)
(pred_2 obj_05 obj_10)
(pred_2 obj_14 obj_07)
(pred_2 obj_03 obj_08)
(pred_2 obj_12 obj_10)
)
(:goal
(and
(pred_2 obj_05 obj_06)
(pred_2 obj_14 obj_08)
(pred_2 obj_03 obj_08)
(pred_2 obj_12 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_07) (pred_1 obj_13 obj_07))))
  )
)
)
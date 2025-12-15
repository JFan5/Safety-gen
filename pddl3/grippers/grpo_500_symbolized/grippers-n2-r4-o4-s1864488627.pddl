(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_1
obj_09 obj_13 obj_08 obj_05 - type_3
obj_07 obj_01 obj_10 obj_04 - type_2
obj_06 obj_02 obj_12 obj_14 - object)
(:init
(pred_3 obj_03 obj_01)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_13)
(pred_3 obj_11 obj_10)
(pred_4 obj_11 obj_08)
(pred_4 obj_11 obj_05)
(pred_2 obj_06 obj_07)
(pred_2 obj_02 obj_01)
(pred_2 obj_12 obj_04)
(pred_2 obj_14 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_10)
(pred_2 obj_02 obj_10)
(pred_2 obj_12 obj_10)
(pred_2 obj_14 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_10) (pred_3 obj_11 obj_10))))
  )
)
)
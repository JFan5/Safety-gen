(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_06 - type_2
obj_04 obj_03 obj_09 obj_11 - type_3
obj_07 obj_12 obj_01 obj_08 - type_1
obj_10 obj_02 obj_05 - object)
(:init
(pred_1 obj_13 obj_12)
(pred_3 obj_13 obj_04)
(pred_3 obj_13 obj_03)
(pred_1 obj_06 obj_01)
(pred_3 obj_06 obj_09)
(pred_3 obj_06 obj_11)
(pred_4 obj_10 obj_01)
(pred_4 obj_02 obj_12)
(pred_4 obj_05 obj_01)
)
(:goal
(and
(pred_4 obj_10 obj_08)
(pred_4 obj_02 obj_07)
(pred_4 obj_05 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_13 obj_07) (pred_1 obj_06 obj_07))))
  )
)
)
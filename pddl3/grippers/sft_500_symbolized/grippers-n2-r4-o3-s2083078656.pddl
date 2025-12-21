(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_1
obj_04 obj_01 obj_13 obj_12 - type_2
obj_11 obj_07 obj_06 obj_08 - type_3
obj_05 obj_09 obj_03 - object)
(:init
(pred_1 obj_10 obj_08)
(pred_3 obj_10 obj_04)
(pred_3 obj_10 obj_01)
(pred_1 obj_02 obj_07)
(pred_3 obj_02 obj_13)
(pred_3 obj_02 obj_12)
(pred_2 obj_05 obj_07)
(pred_2 obj_09 obj_08)
(pred_2 obj_03 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_11)
(pred_2 obj_09 obj_07)
(pred_2 obj_03 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_07) (pred_1 obj_02 obj_07))))
  )
)
)
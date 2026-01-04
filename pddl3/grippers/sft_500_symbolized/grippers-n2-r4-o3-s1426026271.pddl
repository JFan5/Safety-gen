(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_06 - type_3
obj_12 obj_04 obj_08 obj_11 - type_1
obj_10 obj_01 obj_05 obj_07 - type_2
obj_02 obj_09 obj_03 - object)
(:init
(pred_2 obj_13 obj_10)
(pred_4 obj_13 obj_12)
(pred_4 obj_13 obj_04)
(pred_2 obj_06 obj_01)
(pred_4 obj_06 obj_08)
(pred_4 obj_06 obj_11)
(pred_1 obj_02 obj_05)
(pred_1 obj_09 obj_01)
(pred_1 obj_03 obj_01)
)
(:goal
(and
(pred_1 obj_02 obj_05)
(pred_1 obj_09 obj_10)
(pred_1 obj_03 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_13 obj_10) (pred_2 obj_06 obj_10))))
  )
)
)
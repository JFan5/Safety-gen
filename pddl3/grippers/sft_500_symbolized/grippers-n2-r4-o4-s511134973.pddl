(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_09 - type_1
obj_01 obj_02 obj_12 obj_08 - type_2
obj_04 obj_05 obj_07 obj_10 - type_3
obj_06 obj_14 obj_03 obj_11 - object)
(:init
(pred_1 obj_13 obj_07)
(pred_3 obj_13 obj_01)
(pred_3 obj_13 obj_02)
(pred_1 obj_09 obj_04)
(pred_3 obj_09 obj_12)
(pred_3 obj_09 obj_08)
(pred_2 obj_06 obj_10)
(pred_2 obj_14 obj_10)
(pred_2 obj_03 obj_04)
(pred_2 obj_11 obj_04)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_14 obj_10)
(pred_2 obj_03 obj_10)
(pred_2 obj_11 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_13 obj_10) (pred_1 obj_09 obj_10))))
  )
)
)
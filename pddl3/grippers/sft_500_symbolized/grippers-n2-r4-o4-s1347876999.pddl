(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_3
obj_12 obj_01 obj_13 obj_03 - type_1
obj_06 obj_11 obj_07 obj_08 - type_2
obj_09 obj_10 obj_02 obj_14 - object)
(:init
(pred_4 obj_05 obj_07)
(pred_2 obj_05 obj_12)
(pred_2 obj_05 obj_01)
(pred_4 obj_04 obj_08)
(pred_2 obj_04 obj_13)
(pred_2 obj_04 obj_03)
(pred_1 obj_09 obj_08)
(pred_1 obj_10 obj_06)
(pred_1 obj_02 obj_08)
(pred_1 obj_14 obj_07)
)
(:goal
(and
(pred_1 obj_09 obj_11)
(pred_1 obj_10 obj_11)
(pred_1 obj_02 obj_06)
(pred_1 obj_14 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_08) (pred_4 obj_04 obj_08))))
  )
)
)
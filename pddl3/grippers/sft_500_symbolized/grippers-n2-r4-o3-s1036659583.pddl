(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_13 - type_1
obj_06 obj_04 obj_01 obj_08 - type_2
obj_05 obj_10 obj_03 obj_11 - type_3
obj_12 obj_09 obj_07 - object)
(:init
(pred_1 obj_02 obj_11)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_04)
(pred_1 obj_13 obj_10)
(pred_3 obj_13 obj_01)
(pred_3 obj_13 obj_08)
(pred_2 obj_12 obj_10)
(pred_2 obj_09 obj_03)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_12 obj_11)
(pred_2 obj_09 obj_05)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_11) (pred_1 obj_13 obj_11))))
  )
)
)
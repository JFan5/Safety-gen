(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_01 obj_04 obj_10 obj_03 - type_2
obj_05 obj_11 obj_12 - type_3
obj_09 obj_08 obj_06 - object)
(:init
(pred_2 obj_02 obj_11)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_04)
(pred_2 obj_07 obj_05)
(pred_4 obj_07 obj_10)
(pred_4 obj_07 obj_03)
(pred_1 obj_09 obj_05)
(pred_1 obj_08 obj_11)
(pred_1 obj_06 obj_05)
)
(:goal
(and
(pred_1 obj_09 obj_11)
(pred_1 obj_08 obj_11)
(pred_1 obj_06 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_02 obj_11) (pred_2 obj_07 obj_11))))
  )
)
)
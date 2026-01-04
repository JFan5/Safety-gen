(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_06 obj_03 obj_05 obj_04 - type_2
obj_08 obj_10 obj_11 - type_3
obj_01 obj_09 obj_12 - object)
(:init
(pred_4 obj_07 obj_10)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_03)
(pred_4 obj_02 obj_08)
(pred_3 obj_02 obj_05)
(pred_3 obj_02 obj_04)
(pred_2 obj_01 obj_11)
(pred_2 obj_09 obj_08)
(pred_2 obj_12 obj_11)
)
(:goal
(and
(pred_2 obj_01 obj_08)
(pred_2 obj_09 obj_08)
(pred_2 obj_12 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_11) (pred_4 obj_02 obj_11))))
  )
)
)
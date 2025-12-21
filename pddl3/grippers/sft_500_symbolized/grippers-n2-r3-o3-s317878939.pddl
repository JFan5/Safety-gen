(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_02 obj_07 obj_10 obj_12 - type_2
obj_04 obj_06 obj_11 - type_3
obj_03 obj_05 obj_08 - object)
(:init
(pred_1 obj_09 obj_11)
(pred_3 obj_09 obj_02)
(pred_3 obj_09 obj_07)
(pred_1 obj_01 obj_04)
(pred_3 obj_01 obj_10)
(pred_3 obj_01 obj_12)
(pred_2 obj_03 obj_04)
(pred_2 obj_05 obj_11)
(pred_2 obj_08 obj_04)
)
(:goal
(and
(pred_2 obj_03 obj_11)
(pred_2 obj_05 obj_04)
(pred_2 obj_08 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_11) (pred_1 obj_01 obj_11))))
  )
)
)